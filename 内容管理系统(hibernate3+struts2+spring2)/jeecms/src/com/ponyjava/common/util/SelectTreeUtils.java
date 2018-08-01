package com.ponyjava.common.util;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.Stack;
import java.util.TreeSet;

import org.springframework.util.Assert;

import com.jeecms.core.util.PriorityComparator;

public class SelectTreeUtils {
	public static List webTree(List<? extends SelectTree> list) {
		Assert.notNull(list);
		Generator gen = new Generator(list);
		return gen.generate();
	}

	@SuppressWarnings("unchecked")
	public static List handleTreeChild(List<? extends SelectTree> list) {
		Assert.notNull(list);
		ChildHandle childHandle = new ChildHandle(list);
		return childHandle.handle();
	}

	private static class ChildHandle {
		private List<? extends SelectTree> content;
		private Set<Long> idSet;

		public ChildHandle(List<? extends SelectTree> content) {
			Assert.notNull(content);
			this.content = content;

		}

		@SuppressWarnings("unchecked")
		private List handle() {
			collectIds();
			List<SelectTree> roots = getRoots(content, true);
			for (SelectTree r : roots) {
				findChild(r, content);
			}
			return roots;
		}

		private void collectIds() {
			idSet = new HashSet<Long>();
			for (SelectTree node : content) {
				idSet.add(node.getId());
			}
		}

		/**
		 * ��ø��ڵ㡣���ڵ�Ϊ�ջ򸸽ڵ㲻��
		 * 
		 * @param content
		 * @return
		 */
		private List<SelectTree> getRoots(List<? extends SelectTree> content,
				boolean isContain) {
			List<SelectTree> roots = new ArrayList<SelectTree>();
			SelectTree p = null;
			for (SelectTree n : content) {
				p = n.getTreeParent();
				if (p == null || p.getId() == null
						|| !idSet.contains(p.getId())) {
					roots.add(n);
				}
			}
			return roots;
		}

		/**
		 * ����ӽڵ�
		 * 
		 * @param parent
		 * @param content
		 */
		@SuppressWarnings("unchecked")
		private void findChild(SelectTree parent,
				List<? extends SelectTree> content) {
			Set<SelectTree> child = new TreeSet(PriorityComparator.INSTANCE);
			SelectTree p;
			for (SelectTree node : content) {
				p = node.getTreeParent();
				if (p != null && parent.getId().equals(p.getId())) {
					child.add(node);
				}
			}
			parent.setTreeChild(child);
			for (SelectTree c : child) {
				findChild(c, content);
			}
		}
	}

	private static class Generator {
		private List<? extends SelectTree> roots;

		public Generator(List<? extends SelectTree> roots) {
			this.roots = roots;
		}

		/**
		 * ������
		 * 
		 * @return
		 */
		public List<? extends SelectTree> generate() {
			List<SelectTree> container = new ArrayList<SelectTree>();
			Stack<Boolean> isEndList = new Stack<Boolean>();
			isEndList.add(new Boolean(true));
			for (SelectTree o : roots) {
				container = node(container, o, 0, isEndList);
			}
			return container;
		}

		private List<SelectTree> node(List<SelectTree> container,
				SelectTree node, int deep, Stack<Boolean> isEndList) {
			if (container == null) {
				container = new ArrayList<SelectTree>();
			}
			StringBuilder sb = new StringBuilder();
			// �ո���
			if (deep >= 1) {
				sb.append("&nbsp;");
			}
			// ������
			for (int i = 1; i < deep; i++) {
				if (!isEndList.get(i)) {
					sb.append("��");
				} else {
					sb.append("��");
				}
			}
			// �ڵ���
			if (deep == 0) {
				// ���ڵ�
				sb.append("��");
			} else if (isEndList.get(deep)) {
				sb.append("��");
			} else {
				sb.append("��");
			}
			sb.append(node.getTreeName());
			node.setSelectTree(sb.toString());
			container.add(node);
			// �ӽڵ�
			Set<? extends SelectTree> cld = node.getTreeChild();
			if (cld != null) {
				for (Iterator<? extends SelectTree> it = cld.iterator(); it
						.hasNext();) {
					SelectTree o = it.next();
					// ��ջ
					isEndList.push(!it.hasNext());
					node(container, o, deep + 1, isEndList);
					// ��ջ
					isEndList.pop();
				}
			}
			return container;
		}
	}
}
